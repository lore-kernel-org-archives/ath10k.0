Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxn2-0007XL-G5
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 15:08:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 4/4] ath10k: WMI: add hw params entry for wcn3990
Date: Thu, 7 Dec 2017 15:08:22 +0000
Message-ID: <87po7qtw2j.fsf@kamboji.qca.qualcomm.com>
References: <1512214248-17127-1-git-send-email-pillair@qti.qualcomm.com>
 <1512214248-17127-5-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1512214248-17127-5-git-send-email-pillair@qti.qualcomm.com>
 (Rakesh Pillai's message of "Sat, 2 Dec 2017 17:00:48 +0530")
Content-Language: en-US
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
To: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rakesh Pillai <pillair@qti.qualcomm.com> writes:

> Add hw params entry for wcn3990 and populate various
> target specific values for wcn3990.
>
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>

New warning:

drivers/net/wireless/ath/ath10k/hw.c:935:43: warning: Using plain integer as NULL pointer

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
