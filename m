Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG2nG-0008AC-7J
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 08:46:14 +0000
Received: by mail-vc0-f181.google.com with SMTP id ie18so75617vcb.40
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 00:45:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn0=Y97-hN+p2RHzgY1i+h6mevgOHJaPtB2Stv2P4Lnyg@mail.gmail.com>
References: <CAEFj984MeGN=tfBb69rvCm0EvK4txH+vgPyGO7w57v-V1ATHDw@mail.gmail.com>
 <CA+BoTQmbp2XRRa6gW83RoeWyDhKUzbNcGNV0EjRBZ-Gdz+Khbg@mail.gmail.com>
 <CAEFj987fQRBU6=MqyXMxXa6W9_gAu5LPNaywfp+tLwoETXuHrQ@mail.gmail.com>
 <CA+BoTQn0=Y97-hN+p2RHzgY1i+h6mevgOHJaPtB2Stv2P4Lnyg@mail.gmail.com>
Date: Wed, 19 Feb 2014 16:45:52 +0800
Message-ID: <CAEFj985kBhsCnWJnGhMWw-LFguUAfVV3u=2psM+Vaizb+R4qcA@mail.gmail.com>
Subject: Re: QoS Control Field Stripped Off
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Did you remove the call to ath10k_tx_h_qos_workaround() in ath10k_tx()?
Yes. I disable this.

> Did you get any htt tx completion for the frame (look for `htt tx
> completion msdu_id` and `htt tx alloc msdu_id` in traces/logs)? What
> was the status of it?
Try to capture using wireshark and no Tx frames. The following log observed:

[  272.340000] ath10k: htt rx, msg_type: 0x1
[  272.340000] ath10k: htt rx mgmt ctrl
[  272.340000] ath10k: htt tx alloc msdu_id 0
[  272.340000] ath10k: tx-msdu 0x71e2e10
[  272.340000] ath10k: htt data tx using tid 0
[  272.340000] ath10k: htt data tx not mgmt [additional log to
indicate data and not mgmt]
[  272.340000] ath10k: htt rx, msg_type: 0x7
[  272.340000] ath10k: htt tx completion num_msdus 1
[  272.340000] ath10k: htt tx completion msdu_id 0 discard 0 no_ack 0
[  272.340000] ath10k: htt tx free msdu_id 0

So, FW drops the Tx raw frame, even though the htt tx indicates completion?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
