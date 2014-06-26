Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0I8p-0002ba-TG
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 22:27:41 +0000
Received: by mail-oa0-f50.google.com with SMTP id n16so4742860oag.9
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 15:27:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnOBaB0QY6_AtkL6La=aw7gFxgqy_4OLDccuHe7f75mNg@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
 <CA+BoTQnOBaB0QY6_AtkL6La=aw7gFxgqy_4OLDccuHe7f75mNg@mail.gmail.com>
Date: Thu, 26 Jun 2014 15:27:17 -0700
Message-ID: <CABnBrYWEN+KL5vHGggi_b4HZ6gd15yqpna0WBNo0p6i76y9uWw@mail.gmail.com>
Subject: Re: No reorder buffer?
From: Denton Gentry <denton.gentry@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jun 26, 2014 at 3:28 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 24 June 2014 16:47, Denton Gentry <denton.gentry@gmail.com> wrote:
>> I'm bridging ath10k to Ethernet, gathering pcaps on another ath10k
>> system in monitor mode and on the Ethernet system which is receiving
>> the packets. I see packets being delivered out of order to the
>> Ethernet system. So far as I can tell, any packet which has to be
>> re-sent on the Wifi link will be delivered out of order to Ethernet.
>
> As I've mentioned in my other mail - perhaps reordering is disabled in
> firmware under some circumstances.
>
> My suspicion is monitor vdev may be involved. It is created in
> firmware when you set ath10k interface into promisc mode (bridging
> implies that; most sniffers set promisc mode too unless told to not
> to, e.g. tcpdump -p).
>
> Can you somehow verify if you observe the reordering problem without
> bridging with ethernet (e.g. run traffic to AP w/ bridging and w/o
> bridging) ? If it's too much work then forget it :-)

Running an iperf server on my AP, to take bridging out of the picture:
iperf -s -w 1M

Using a Windows iperf client to talk to it:
iperf.exe -c 192.168.254.2 -w 1M -P 1 -i 1 -l 64K -t 10

With the unmodified ath10k (with no reorder buffer) I get 56.7 Mbps.
There is a fair degree of variability second to second, from 41 Mbps
to 76 Mbps.

With the modified driver which always allocates
sta->ampdu_mlme.tid_rx[0] I get 156 Mbps, with a much smaller degree
of variability of 152 - 161 Mbps second to second.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
