Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoBed-0004Vp-RA
 for ath10k@lists.infradead.org; Mon, 19 Oct 2015 14:43:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2 v2] ath10k: print firwmare stats specific to firmware
 version
References: <1444812751-11103-1-git-send-email-c_traja@qti.qualcomm.com>
Date: Mon, 19 Oct 2015 17:42:40 +0300
In-Reply-To: <1444812751-11103-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Wed, 14 Oct 2015 14:22:31 +0530")
Message-ID: <87vba2gbrz.fsf@kamboji.qca.qualcomm.com>
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

<c_traja@qti.qualcomm.com> writes:

> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>
> Currently printing fw stats in ath10k is common to all firmware versions.
> Printing all the stats might lead to confusion because some of the stats
> are firmware specific and when printed will have 0's.
> Below patchset prints firmware stats specific to firmware.
>
> v2:
>         > All the filtered functions moved to wmi.c
>         > Added firmware stats support for 10.4 firmware.
>
> Manikanta (2):
>   ath10k: Make fw stats prints specific to firmware version

Applied this patch.

>   ath10k: add fw_stats support to 10.4 firmware

Dropped this patch due to the bug I saw. Please resend once you have
fixed that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
