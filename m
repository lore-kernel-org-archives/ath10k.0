Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnOTu-00068w-Ob
 for ath10k@lists.infradead.org; Mon, 02 Dec 2013 08:03:51 +0000
Received: by mail-we0-f179.google.com with SMTP id q59so11688364wes.10
 for <ath10k@lists.infradead.org>; Mon, 02 Dec 2013 00:03:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87wqjnbsw0.fsf@kamboji.qca.qualcomm.com>
References: <1385737763-10481-1-git-send-email-bartosz.markowski@tieto.com>
 <87wqjnbsw0.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 2 Dec 2013 09:03:25 +0100
Message-ID: <CACKGw+HBo5RxiyLp8zJ7tySMu=B6YkELUso_ZTjpmFq26U0jeA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix multi BSSID with WPA on FW 10.1
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On 2 December 2013 08:42, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> From: Michal Kazior <michal.kazior@tieto.com>
>>
>> FW 10.1 seems to require the default key index to
>> be updated to point to group key after it is
>> installed. Otherwise Txed frames are corrupted.
>>
>> Tested-by: Tomasz Skapski <tomasz.skapski@tieto.com>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> I see few checkpatch warnings:
>
> drivers/net/wireless/ath/ath10k/mac.c:2721: ERROR: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/mac.c:2722: ERROR: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/mac.c:2723: ERROR: code indent should use tabs where possible

ouch, sorry for that. I'll send a v2 in a sec.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
