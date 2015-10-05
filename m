Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj5w8-0005eU-4j
 for ath10k@lists.infradead.org; Mon, 05 Oct 2015 13:36:17 +0000
Message-ID: <56127CB9.1020100@candelatech.com>
Date: Mon, 05 Oct 2015 06:35:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Slow ramp-up for single-stream TCP throughput on 4.2 kernel.
References: <560F1672.5000602@candelatech.com>		<560F1F74.9010207@candelatech.com>		<CADVnQym4U_dVVRdOVhORvVabwFjSHTQJ_LbbbYtzWVu0=mAp_A@mail.gmail.com>		<56105AD2.7070906@candelatech.com>	
 <CADVnQynKmhrpD63sF5aWPYo9f8L3wOMuEyACBnTdkzQQ=D1_uA@mail.gmail.com>	
 <56115C68.1080803@candelatech.com>
 <1443979705.32531.71.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <1443979705.32531.71.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, ath10k <ath10k@lists.infradead.org>



On 10/04/2015 10:28 AM, Eric Dumazet wrote:
> On Sun, 2015-10-04 at 10:05 -0700, Ben Greear wrote:
>
>> I guess I'll just stop using Cubic.  Any suggestions for another
>> congestion algorithm to use?  I'd prefer something that worked well
>> in pretty much any network condition, of course, and it has to work with
>> ath10k.
>>
>> We can also run some tests with 1G, 10G, ath10k, ath9k, and in conjunction
>> with network emulators and various congestion control algorithms.
>
> You could use cubic , but disable or tune HyStart, which is known to be
> problematic anyway.
>
> echo  0 >/sys/module/tcp_cubic/parameters/hystart_detect

I ran some more tests this morning.  The first bump in the graph
has the setting above.  Seems to work pretty good.

The second is using RENO.  Also good, and a small bit of higher over-all
throughput (about 555-560Mbps of RX throughput).

Third is 'highspeed'.  It ramps up quickly, but seems a bit more jagged, and
not quite as fast as RENO.

>
> Or try
>
> echo 40 >/sys/module/tcp_cubic/parameters/hystart_low_window

The last graph is this setting (with hystart_detect set back to 3,
which was the default on my system).

This is better than stock cubic, but it still is awful compared
to the others.

http://www.candelatech.com/downloads/tcp_cong_ath10k_2.pdf

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
