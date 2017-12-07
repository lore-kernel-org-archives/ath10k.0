Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxjr-0005yN-HT
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 15:05:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/4] ath10k: WMI: modify svc bitmap parsing for wcn3990
Date: Thu, 7 Dec 2017 15:04:55 +0000
Message-ID: <87y3metw8f.fsf@kamboji.qca.qualcomm.com>
References: <1512214248-17127-1-git-send-email-pillair@qti.qualcomm.com>
 <1512214248-17127-2-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1512214248-17127-2-git-send-email-pillair@qti.qualcomm.com>
 (Rakesh Pillai's message of "Sat, 2 Dec 2017 17:00:45 +0530")
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

> Due to the limitation of wmi tlv parsing logic, if there are
> two parameters in a wmi event with same tlv tag, we can get only
> the last value, as it overwrites the prev value of the same tlv tag.
>
> The service ready event in wcn3990 contains two parameters of the
> same tag UINT32, due to which the svc bitmap is overwritten with the
> DBS support parameter.
>
> Refactor the service ready event parsing to allow parsing two tlv
> of the same tag UINT32 for wcn3990.
>
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>

ath10k-check found a warning in this patch:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:981: braces {} are not necessary for single statement blocks

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
