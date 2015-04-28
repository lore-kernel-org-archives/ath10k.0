Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn77w-0005jJ-GP
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 15:08:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Modifing and installing ath10k driver for kernel 4.0
References: <BB63CF2605733841BD56CD9C38AC1F7E1E678CA8@MBX23.d.ethz.ch>
 <CA+BoTQmGCnAepE0OWEiO1ASrLEbsmrKqf2zS-s2WpAbkhX4vaw@mail.gmail.com>
Date: Tue, 28 Apr 2015 18:08:16 +0300
In-Reply-To: <CA+BoTQmGCnAepE0OWEiO1ASrLEbsmrKqf2zS-s2WpAbkhX4vaw@mail.gmail.com>
 (Michal Kazior's message of "Mon, 27 Apr 2015 13:03:11 +0200")
Message-ID: <87383k70kf.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Costa Molero Edgar <cedgar@student.ethz.ch>

Michal Kazior <michal.kazior@tieto.com> writes:

> You can still use backports though. All you need is to build backports
> package yourself[1] from whatever kernel tree you desire, e.g.
> github.com/kvalo/ath instead of using the pre-built one.
>
> [1]: https://backports.wiki.kernel.org/index.php/Documentation/backports/hacking

I also wrote something about ath10k and backports:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
