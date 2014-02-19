Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGBHG-0002CX-Rz
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 17:49:48 +0000
Message-ID: <5304EEA0.6060808@candelatech.com>
Date: Wed, 19 Feb 2014 09:49:20 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: QoS Control Field Stripped Off
References: <CAEFj984MeGN=tfBb69rvCm0EvK4txH+vgPyGO7w57v-V1ATHDw@mail.gmail.com>
 <CA+BoTQmbp2XRRa6gW83RoeWyDhKUzbNcGNV0EjRBZ-Gdz+Khbg@mail.gmail.com>
 <CAEFj987fQRBU6=MqyXMxXa6W9_gAu5LPNaywfp+tLwoETXuHrQ@mail.gmail.com>
 <CA+BoTQn0=Y97-hN+p2RHzgY1i+h6mevgOHJaPtB2Stv2P4Lnyg@mail.gmail.com>
 <CAEFj985kBhsCnWJnGhMWw-LFguUAfVV3u=2psM+Vaizb+R4qcA@mail.gmail.com>
 <CA+BoTQ=eweYOAP=7zX=QCNX+wqjEohz9-RVh-Vcm4FQHtYQagQ@mail.gmail.com>
In-Reply-To: <CA+BoTQ=eweYOAP=7zX=QCNX+wqjEohz9-RVh-Vcm4FQHtYQagQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/19/2014 01:37 AM, Michal Kazior wrote:
> On 19 February 2014 09:45, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>> Did you remove the call to ath10k_tx_h_qos_workaround() in ath10k_tx()?
>> Yes. I disable this.
>>
>>> Did you get any htt tx completion for the frame (look for `htt tx
>>> completion msdu_id` and `htt tx alloc msdu_id` in traces/logs)? What
>>> was the status of it?
>> Try to capture using wireshark and no Tx frames. The following log observed:
>>
>> [  272.340000] ath10k: htt rx, msg_type: 0x1
>> [  272.340000] ath10k: htt rx mgmt ctrl
>> [  272.340000] ath10k: htt tx alloc msdu_id 0
>> [  272.340000] ath10k: tx-msdu 0x71e2e10
>> [  272.340000] ath10k: htt data tx using tid 0
>> [  272.340000] ath10k: htt data tx not mgmt [additional log to
>> indicate data and not mgmt]
>> [  272.340000] ath10k: htt rx, msg_type: 0x7
>> [  272.340000] ath10k: htt tx completion num_msdus 1
>> [  272.340000] ath10k: htt tx completion msdu_id 0 discard 0 no_ack 0
>> [  272.340000] ath10k: htt tx free msdu_id 0
>>
>> So, FW drops the Tx raw frame, even though the htt tx indicates completion?
> 
> This might be HW itself as well. I'm adding Ben to the discussion.
> 
> Ben: You've done some research on tx/rx in firmware to get software
> encryption in ath10k going, right? Did you play with raw tx format or
> see any obstacles in the code that could prevent it from working?

I never managed to get raw tx mode working with encrypted traffic,
but at least some of those problems might have been some experimental
patches I had in the firmware that were later proved to be broken
(in non-raw tx mode, at least).

In the non-raw (henceforth cooked) mode, the hardware and/or firmware
definitely re-writes the header and will add/remove bits to match
it's idea of what the packet should look like.  It appears impossible
to disable this 'feature' in cooked tx mode.

In my firmware, I did manage to disable the rx decrypt logic so that
I can do sw-crypt.  But, I ended up leaving the transmit path alone
and still using cooked frames and letting the hardware do the packet
encryption and header manipulation.

In my opinion, you will likely require at least firmware source
or someone's help that has access to firmware source to
figure out how to make raw tx mode work if it does not work
immediately for you.

I am busy chasing other firmware issues at the moment, but when I get
that wrapped up (and no idea how long it will take), then I might be able
to at least help get my firmware capable of doing raw tx mode.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
