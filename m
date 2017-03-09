Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clsgW-00012B-B1
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 07:40:29 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
Date: Thu, 9 Mar 2017 07:39:58 +0000
Message-ID: <87d1dq6grf.fsf@kamboji.qca.qualcomm.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CAHNpzpdbTnapQFPwYhUhi5EvLjQSdpqy9AHMH04KcqF2jHWw_A@mail.gmail.com>
 <CAHNpzpeao2rT8JJ5rSALHknrkFHniixJftGLTnUxcd7RtoYdtQ@mail.gmail.com>
 <13839ca7-e43e-8475-04de-8c705c4e3ee2@gmail.com>
 <CAHNpzpf5Xd9JYnbt5b-hRhC0tjnGWY2HLdnBUdHkGcdi6-ytGQ@mail.gmail.com>
 <3bc420d1-ced9-f0a3-647a-5b81775a543e@gmail.com>
In-Reply-To: <3bc420d1-ced9-f0a3-647a-5b81775a543e@gmail.com> (Erik
 Stromdahl's message of "Wed, 1 Mar 2017 07:25:14 +0100")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Akesh M Chacko <akesh.chacko@vvdntech.in>, Ann Lo <annlo.tech@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

sorry for the late reply, I was on vacation and catching up now.

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Firmware and board files are normally distributed by the module vendor
> (MuRata, Silex, etc.).
>
> Firmware is depending on chipset, so this is something QCA should be able
> to provide.
>
> Board files are module dependent and contains calibration etc. and should
> definitely be obtained from the module vendor.
>
> If you have a discrete design you would most likely have to create your own
> board file (using ART etc.)
>
> Kalle:
> Perhaps you (or someone else at QCA) can initiate the work to make the sdio
> firmware publicly available?

I'll send a request forward internally, but that might take a while as
I'm heavily backlogged at the moment.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
