Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxlf-0007L9-N0
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 15:07:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/4] ath10k: WMI: Add management tx by reference
 support over wmi
Date: Thu, 7 Dec 2017 15:06:48 +0000
Message-ID: <87tvx2tw54.fsf@kamboji.qca.qualcomm.com>
References: <1512214248-17127-1-git-send-email-pillair@qti.qualcomm.com>
 <1512214248-17127-3-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1512214248-17127-3-git-send-email-pillair@qti.qualcomm.com>
 (Rakesh Pillai's message of "Sat, 2 Dec 2017 17:00:46 +0530")
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

> HL1.0 firmware branch, used in wcn3990, transmits management
> frames by reference over WMI.
>
> Add support for management tx by reference over WMI.
>
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>

This one has an endian problem:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:2537:22: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:2537:22:    expected restricted __le32 [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi-tlv.c:2537:22:    got unsigned int [unsigned] [assigned] [usertype] vdev_id

I recommend running ath10k-check before submission:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#checking_code

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
