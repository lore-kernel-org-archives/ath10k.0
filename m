Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Swj-0008Ip-6e
 for ath10k@lists.infradead.org; Tue, 28 Jul 2020 16:59:26 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <8359a849-2b8a-c842-a501-c6cb6966e345@dd-wrt.com>
 <20200725145728.10556-1-hdanton@sina.com>
 <2664182a-1d03-998d-8eff-8478174a310a@dd-wrt.com>
 <cb54c2746a3d4ce695e3bda8b576b40e@AcuMS.aculab.com>
In-Reply-To: <cb54c2746a3d4ce695e3bda8b576b40e@AcuMS.aculab.com>
Subject: RE: [RFC 0/7] Add support to process rx packets in thread
Date: Tue, 28 Jul 2020 22:29:02 +0530
Message-ID: <001001d66500$69a58970$3cf09c50$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'David Laight' <David.Laight@ACULAB.COM>, 'Sebastian Gottschall' <s.gottschall@dd-wrt.com>, 'Hillf Danton' <hdanton@sina.com>
Cc: 'Andrew Lunn' <andrew@lunn.ch>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 'Markus Elfring' <Markus.Elfring@web.de>, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org



> -----Original Message-----
> From: David Laight <David.Laight@ACULAB.COM>
> Sent: Sunday, July 26, 2020 4:46 PM
> To: 'Sebastian Gottschall' <s.gottschall@dd-wrt.com>; Hillf Danton
> <hdanton@sina.com>
> Cc: Andrew Lunn <andrew@lunn.ch>; Rakesh Pillai <pillair@codeaurora.org>;
> netdev@vger.kernel.org; linux-wireless@vger.kernel.org; linux-
> kernel@vger.kernel.org; ath10k@lists.infradead.org;
> dianders@chromium.org; Markus Elfring <Markus.Elfring@web.de>;
> evgreen@chromium.org; kuba@kernel.org; johannes@sipsolutions.net;
> davem@davemloft.net; kvalo@codeaurora.org
> Subject: RE: [RFC 0/7] Add support to process rx packets in thread
> 
> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> > Sent: 25 July 2020 16:42
> > >> i agree. i just can say that i tested this patch recently due this
> > >> discussion here. and it can be changed by sysfs. but it doesnt work for
> > >> wifi drivers which are mainly using dummy netdev devices. for this i
> > >> made a small patch to get them working using napi_set_threaded
> manually
> > >> hardcoded in the drivers. (see patch bellow)
> 
> > > By CONFIG_THREADED_NAPI, there is no need to consider what you did
> here
> > > in the napi core because device drivers know better and are responsible
> > > for it before calling napi_schedule(n).
> 
> > yeah. but that approach will not work for some cases. some stupid
> > drivers are using locking context in the napi poll function.
> > in that case the performance will runto shit. i discovered this with the
> > mvneta eth driver (marvell) and mt76 tx polling (rx  works)
> > for mvneta is will cause very high latencies and packet drops. for mt76
> > it causes packet stop. doesnt work simply (on all cases no crashes)
> > so the threading will only work for drivers which are compatible with
> > that approach. it cannot be used as drop in replacement from my point of
> > view.
> > its all a question of the driver design
> 
> Why should it make (much) difference whether the napi callbacks (etc)
> are done in the context of the interrupted process or that of a
> specific kernel thread.
> The process flags (or whatever) can even be set so that it appears
> to be the expected 'softint' context.
> 
> In any case running NAPI from a thread will just show up the next
> piece of code that runs for ages in softint context.
> I think I've seen the tail end of memory being freed under rcu
> finally happening under softint and taking absolutely ages.
> 
> 	David
> 

Hi All,

Is the threaded NAPI change posted to kernel ? 
Is the conclusion of this discussion that " we cannot use threads for processing packets " ??


> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> Registration No: 1397386 (Wales)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
