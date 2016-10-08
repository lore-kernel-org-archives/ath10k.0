Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bssQu-0003Rp-1b
 for ath10k@lists.infradead.org; Sat, 08 Oct 2016 14:17:01 +0000
Received: by mail-qt0-x235.google.com with SMTP id s49so32370013qta.0
 for <ath10k@lists.infradead.org>; Sat, 08 Oct 2016 07:16:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475852332-18217-2-git-send-email-akolli@qti.qualcomm.com>
References: <1475852332-18217-1-git-send-email-akolli@qti.qualcomm.com>
 <1475852332-18217-2-git-send-email-akolli@qti.qualcomm.com>
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Date: Sat, 8 Oct 2016 22:16:37 +0800
Message-ID: <CAEFj985tCc_4Q_zfwRtoT0fjfZv0u_c5E8SRSQVz=V4tiHh+GA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: add per peer htt tx stats support for 10.4
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Oct 7, 2016 at 10:58 PM,  <akolli@qti.qualcomm.com> wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> Per peer tx stats are part of 'HTT_10_4_T2H_MSG_TYPE_PEER_STATS'
> event, Firmware sends one HTT event for every four PPDUs.
> HTT payload has success pkts/bytes, failed pkts/bytes, retry
> pkts/bytes and rate info per ppdu.
> Peer stats are enabled through 'WMI_SERVICE_PEER_STATS',
> which are nowadays enabled by default.
>
> Parse peer stats and update the tx rate information per STA.
>
> tx rate, Peer stats are tested on QCA4019 with Firmware version
> 10.4-3.2.1-00028.
>

Is QCA988X supported? I have tried to test with
firmware-5.bin_10.2.4.70.56 but not working.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
