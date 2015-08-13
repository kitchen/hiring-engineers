Your answers to the questions go here.

# Level 1

1. Done
2. the agent is the software that runs on my node(s) and gathers metrics about the running system and submits them to datadog
3. see [level1/api-event.bash](level1/api-event.bash)
4. see [level1/api-event-to-email.bash](level1/api-event-to-email.bash)

# Level 2
1. See [level2/instrumented-app-1.rb](level2/instrumented-app-1.rb)
2. Multiple:

    * using app from 2.1
    * run `ab -n 1000000 -t 300 -c 30 http://localhost:4567/hi`
    * [graph here](https://app.datadoghq.com/event/event?id=2929955795644715010)

3. same app and ab from above, though I changed the random sleeps to get something a bit more 'interesting'
  
    * [graph here](https://app.datadoghq.com/event/event?id=2937187588865265665)

4. Request rate and speed vs cpu load: [graph here](https://app.datadoghq.com/dash/63238/response-times?live=true&page=0&is_auto=false&from_ts=1439329482000&to_ts=1439333082000&tile_size=m)

# Level 3

* See [level3/app.rb](level3/app.rb)

    Also note that I would not have done it this way with a real web app. I would have made a rack middleware for this to time *all* calls, and allow (at least in rails) controllers to specify their own tags on the latency metrics. I did it here this way for brevity :)

* I fired up ab against both /hi and /foo. They have different sleeps so they should produce different metrics. I also changed around the sleeps a couple of times to get non-flatline-graphs :)

* graph [here](https://app.datadoghq.com/event/event?id=2938762822831575041)

# Level 4

* total counts: https://app.datadoghq.com/event/event?id=2938970000075001857
* counts broken down by page: https://app.datadoghq.com/event/event?id=2938969919611473923

Also note that the statsd timing functionality keeps track of counts, so my extra count is redundant. I want to say I had problems with that before in another life (and using statsd + graphite vs datadog) so I keep both metrics.

Spikiness is caused by metric storage alignment? I honestly am not sure :) I also am not really seeing spikiness, but my application and its load is *extremely* artificial, so I may just not be getting very good data.

# Level 5

After an embarassingly long struggle with `/etc/dd-agent/conf.d/random.yml` vs `/etc/dd-agent/conf.d/random.yaml`, it is up and running!

Graph can be found here: https://app.datadoghq.com/event/event?id=2939013494588051457


