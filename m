Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKLGD-0008Dc-HF
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 06:54:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA6174 hw2.1 irq_mode=0 broken on 4.2-rc3, working on 4.1.2
References: <CAMQd7mbWC7rj8-eU7Jv21ehT8KrpC=L=xWxzDQxHEU_ePNSdUg@mail.gmail.com>
 <CA+BoTQmd0Uoi=2MNMsDXYe1yKsYa3P8uvVzWwXoMynQGtjeD4w@mail.gmail.com>
 <CAMQd7maioLviTaLHp+f03HafABijKD_d92K_SRO8XS51poKGqg@mail.gmail.com>
 <CA+BoTQkA0k1RBwzKFchcWebuWUmdoaqvaAq4BRz2o3C-GGUCog@mail.gmail.com>
 <CAMQd7ma7hehYLBf-5hUD0sViUwWGX8vy7ENXuBi8Q49F88A45Q@mail.gmail.com>
 <CA+BoTQkqttvPkk6qk6YV8SYPVnEcADfcUkLBCpjFoZBab81Byg@mail.gmail.com>
Date: Wed, 29 Jul 2015 09:54:06 +0300
In-Reply-To: <CA+BoTQkqttvPkk6qk6YV8SYPVnEcADfcUkLBCpjFoZBab81Byg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 29 Jul 2015 07:28:19 +0200")
Message-ID: <871tfr8ne9.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Enrico Tagliavini <enrico.tagliavini@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> This wont work for bisecting. I have to setup something else. Is
>> it ok if I restrict the bisect on the ath10k tree? That has enough
>> commit already to begin with, plus I'm going to be on the road in less
>> than two weeks.
>
> As long as you establish a working and a non-working commit id on
> kvalo tree it should be fine I guess.

And you can always limit the bisect to a certain directory, but the risk
here is that if the regression is outside ath10k bisect won't find it.
So you need to carefully consider is it safe to do or not. From the man
page:

"Cutting down bisection by giving more parameters to bisect start

       You can further cut down the number of trials, if you know what
       part of the tree is involved in the problem you are tracking
       down, by specifying path parameters when issuing the bisect start
       command:

           $ git bisect start -- arch/i386 include/asm-i386"

Also if you can even just narrow down the regression to a smaller set of
patches, let's say few hundred, might make it easier to find the
regression.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
