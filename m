Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGKB-0000fS-Hz
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 08:55:16 +0000
Received: by ykek133 with SMTP id k133so119761164yke.2
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2015 00:54:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87lhadbqhi.fsf@kamboji.qca.qualcomm.com>
References: <1446638015-23310-1-git-send-email-bartosz.markowski@tieto.com>
 <1446638015-23310-5-git-send-email-bartosz.markowski@tieto.com>
 <87lhadbqhi.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 5 Nov 2015 09:54:54 +0100
Message-ID: <CACKGw+HSx6btFRtj9gMr=ORd9zEbo8=6dukUxMnJkEn-+-Ud5A@mail.gmail.com>
Subject: Re: [PATCH 4/4] ath10k: add QCA9377 hw1.0 support
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 4 November 2015 at 18:53, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> Add new BMI target version and chip id revision. Register it
>> on supported chips list.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> This one has whitespace issues:
>
> drivers/net/wireless/ath/ath10k/core.c:163: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:163: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:164: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:164: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:165: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:165: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:166: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:166: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:167: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:167: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:168: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:168: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:169: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:169: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:170: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:170: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:171: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:171: please, no spaces at the start of a line
> drivers/net/wireless/ath/ath10k/core.c:172: code indent should use tabs where possible
> drivers/net/wireless/ath/ath10k/core.c:172: please, no spaces at the start of a line

Sorry about that. I've resend it now.



-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
