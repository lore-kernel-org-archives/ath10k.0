Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuD2R-0001Tj-VE
 for ath10k@lists.infradead.org; Sat, 01 Apr 2017 07:01:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: firmware version 10.2.4.70.54 crash when running on
 centos-7.3(kernel version -> 3.10.0-514.el7.x86_64)
Date: Sat, 1 Apr 2017 07:01:03 +0000
Message-ID: <87r31cpq6q.fsf@kamboji.qca.qualcomm.com>
References: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>
 <87y3vlr9r6.fsf@kamboji.qca.qualcomm.com>
 <CAEi_5N0291YRJzzguecbMSKGGCg6muEEudwhA1BJ33NKnvDPcQ@mail.gmail.com>
In-Reply-To: <CAEi_5N0291YRJzzguecbMSKGGCg6muEEudwhA1BJ33NKnvDPcQ@mail.gmail.com>	(Chirag
 Shahani's message of "Fri, 31 Mar 2017 12:39:13 -0700")
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
To: Chirag Shahani <chirag.shahani@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Chirag Shahani <chirag.shahani@gmail.com> writes:

> My aim to use this kernel centos 7.1 kernel
> 3.10.0-229.48.1.el7.x86_64. Could you please let me know which
> backport relase I should try to have the latest firmware for centos
> 7.1 kernel 3.10.0-229.48.1.el7.x86_64

The problem with backports projects is that right now they are not
making any official releases. But a release within the past year, or
taking the latest from git, is what I would do. At least then you would
not be using an ancient version of ath10k.

There's some documentation here:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
