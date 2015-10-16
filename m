Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn4eD-0004dI-F7
 for ath10k@lists.infradead.org; Fri, 16 Oct 2015 13:02:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2 v2] ath10k: Make fw stats prints specific to firmware
 version
References: <1444812821-11138-1-git-send-email-c_traja@qti.qualcomm.com>
Date: Fri, 16 Oct 2015 16:01:34 +0300
In-Reply-To: <1444812821-11138-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Wed, 14 Oct 2015 14:23:41 +0530")
Message-ID: <87lhb3ge6p.fsf@kamboji.qca.qualcomm.com>
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

> From: Manikanta <c_mpubbi@qti.qualcomm.com>
>
> The patch makes debug stats prints fw specific by adding a new member
> in wmi_ops
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch added few checkpatch warnings, I fixed them in the pending
branch.

drivers/net/wireless/ath/ath10k/wmi-ops.h:1297: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/wmi.c:6628: Missing a blank line after declarations
drivers/net/wireless/ath/ath10k/wmi.c:6638: Missing a blank line after declarations

Also I fixed Manikanta's name and added his Signed-off-by line which you
had accidentally dropped.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
