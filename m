Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablLK-0007MG-2T
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:44:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Reduce number of peers to support peer stats
 feature
Date: Fri, 4 Mar 2016 08:43:43 +0000
Message-ID: <87wppiy6o5.fsf@kamboji.qca.qualcomm.com>
References: <1456210197-27892-1-git-send-email-akolli@qti.qualcomm.com>
In-Reply-To: <1456210197-27892-1-git-send-email-akolli@qti.qualcomm.com>
 (akolli@qti.qualcomm.com's message of "Tue, 23 Feb 2016 12:19:57	+0530")
Content-Language: en-US
Content-ID: <609A3E0DD8EE3047A7596D48ADB6498E@qualcomm.com>
MIME-Version: 1.0
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
To: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<akolli@qti.qualcomm.com> writes:

> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> To enable per peer stats feature we are reducing the number of peers.
> Firmware has introduced tx stats feature. We have memory limitation in
> firmware to add these additional bytes.
>
> These are the new variables introduced in the firmware.
> ========		=======================
> Variable	      	Bytes required/per rate
> ========		=======================
> TX success packets 	1
> TX failed packets	1
> Retry packets		1
> Success bytes		2
> TX failed bytes		2
> Retry bytes		2
> Tx duration		4
> Rate			1
> Bw and AMPDU flags	1
> Total			16 (because of allocation in word pattern)
>
> Firmware sends these tx_stats in pktlog.
> If we consider 4 feedbacks at a time, Frimware need about ~1K memory for coding
> and 8192 bytes required / per rate [ 4*16*128(peers)].
> To accommodate this firmware needs to reduce 10 peers.
>
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Applied, thanks.

I add a note in the commit log that this fixes a crash with
firmware-5.bin_10.2.4.70.22-2.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
