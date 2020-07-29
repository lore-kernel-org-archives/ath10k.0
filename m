Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail3-162.sinamail.sina.com.cn ([202.108.3.162])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0azb-0000fy-3X
 for ath10k@lists.infradead.org; Wed, 29 Jul 2020 01:34:53 +0000
From: Hillf Danton <hdanton@sina.com>
Subject: RE: [RFC 0/7] Add support to process rx packets in thread
Date: Wed, 29 Jul 2020 09:34:25 +0800
Message-Id: <20200729013425.13740-1-hdanton@sina.com>
In-Reply-To: <001001d66500$69a58970$3cf09c50$@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <8359a849-2b8a-c842-a501-c6cb6966e345@dd-wrt.com>
 <20200725145728.10556-1-hdanton@sina.com>
 <2664182a-1d03-998d-8eff-8478174a310a@dd-wrt.com>
 <cb54c2746a3d4ce695e3bda8b576b40e@AcuMS.aculab.com>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Hillf Danton <hdanton@sina.com>, evgreen@chromium.org, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, dianders@chromium.org, David Laight <David.Laight@ACULAB.COM>, Markus Elfring <Markus.Elfring@web.de>, ath10k@lists.infradead.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org, Felix Fietkau <nbd@nbd.name>


On Tue, 28 Jul 2020 22:29:02 +0530 Rakesh Pillai wrote:
> > -----Original Message-----
> > From: David Laight <David.Laight@ACULAB.COM>
> > Sent: Sunday, July 26, 2020 4:46 PM
> > To: 'Sebastian Gottschall' <s.gottschall@dd-wrt.com>; Hillf Danton
> > <hdanton@sina.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Rakesh Pillai =
> <pillair@codeaurora.org>;
> > netdev@vger.kernel.org; linux-wireless@vger.kernel.org; linux-
> > kernel@vger.kernel.org; ath10k@lists.infradead.org;
> > dianders@chromium.org; Markus Elfring <Markus.Elfring@web.de>;
> > evgreen@chromium.org; kuba@kernel.org; johannes@sipsolutions.net;
> > davem@davemloft.net; kvalo@codeaurora.org
> > Subject: RE: [RFC 0/7] Add support to process rx packets in thread
> >=20
> > From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> > > Sent: 25 July 2020 16:42
> > > >> i agree. i just can say that i tested this patch recently due =
> this
> > > >> discussion here. and it can be changed by sysfs. but it doesnt =
> work for
> > > >> wifi drivers which are mainly using dummy netdev devices. for =
> this i
> > > >> made a small patch to get them working using napi_set_threaded
> > manually
> > > >> hardcoded in the drivers. (see patch bellow)
> >=20
> > > > By CONFIG_THREADED_NAPI, there is no need to consider what you did
> > here
> > > > in the napi core because device drivers know better and are =
> responsible
> > > > for it before calling napi_schedule(n).
> >=20
> > > yeah. but that approach will not work for some cases. some stupid
> > > drivers are using locking context in the napi poll function.
> > > in that case the performance will runto shit. i discovered this with =
> the
> > > mvneta eth driver (marvell) and mt76 tx polling (rx  works)
> > > for mvneta is will cause very high latencies and packet drops. for =
> mt76
> > > it causes packet stop. doesnt work simply (on all cases no crashes)
> > > so the threading will only work for drivers which are compatible =
> with
> > > that approach. it cannot be used as drop in replacement from my =
> point of
> > > view.
> > > its all a question of the driver design
> >=20
> > Why should it make (much) difference whether the napi callbacks (etc)
> > are done in the context of the interrupted process or that of a
> > specific kernel thread.
> > The process flags (or whatever) can even be set so that it appears
> > to be the expected 'softint' context.
> >=20
> > In any case running NAPI from a thread will just show up the next
> > piece of code that runs for ages in softint context.
> > I think I've seen the tail end of memory being freed under rcu
> > finally happening under softint and taking absolutely ages.
> >=20
> > 	David
> >=20
> 
> Hi All,
> 
> Is the threaded NAPI change posted to kernel ?

https://lore.kernel.org/netdev/20200726163119.86162-1-nbd@nbd.name/
https://lore.kernel.org/netdev/20200727123239.4921-1-nbd@nbd.name/

> Is the conclusion of this discussion that " we cannot use threads for
> processing packets " ??

That isn't it if any conclusion reached. Hard to answer your question
TBH, and OTOH I'm wondering in which context device driver developer
prefers to handle tx/rx, IRQ or BH or user context on available idle
CPUs, what is preventing them from doing that? Is it likely making
ant-antenna-size sense to set the napi::weight to 3 and turn to 30
kworkers for processing the ten-minute packet flood hitting the hardware
for instance on a system with 32 CPU cores or more?



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
