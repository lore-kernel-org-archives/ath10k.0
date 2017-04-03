Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv45N-0006VU-Si
 for ath10k@lists.infradead.org; Mon, 03 Apr 2017 15:40:07 +0000
Received: by mail-qk0-x232.google.com with SMTP id d10so118174999qke.1
 for <ath10k@lists.infradead.org>; Mon, 03 Apr 2017 08:39:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r31cpq6q.fsf@kamboji.qca.qualcomm.com>
References: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>
 <87y3vlr9r6.fsf@kamboji.qca.qualcomm.com>
 <CAEi_5N0291YRJzzguecbMSKGGCg6muEEudwhA1BJ33NKnvDPcQ@mail.gmail.com>
 <87r31cpq6q.fsf@kamboji.qca.qualcomm.com>
From: Chirag Shahani <chirag.shahani@gmail.com>
Date: Mon, 3 Apr 2017 08:39:43 -0700
Message-ID: <CAEi_5N1iOVbBX8HVWVoaAMczcSSCHNSB6drm4L0EDWX8bVxY0Q@mail.gmail.com>
Subject: Re: firmware version 10.2.4.70.54 crash when running on
 centos-7.3(kernel version -> 3.10.0-514.el7.x86_64)
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,

Thank you for all the info. I used the backport release
backports-4.2.6-1 signed with firmware 10.2.4-1.0 (as this has a
commit recently) and have not faced any crash until now.
--
Chirag

On Sat, Apr 1, 2017 at 12:01 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Chirag Shahani <chirag.shahani@gmail.com> writes:
>
>> My aim to use this kernel centos 7.1 kernel
>> 3.10.0-229.48.1.el7.x86_64. Could you please let me know which
>> backport relase I should try to have the latest firmware for centos
>> 7.1 kernel 3.10.0-229.48.1.el7.x86_64
>
> The problem with backports projects is that right now they are not
> making any official releases. But a release within the past year, or
> taking the latest from git, is what I would do. At least then you would
> not be using an ancient version of ath10k.
>
> There's some documentation here:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
