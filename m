Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRbPT-0008RL-U1
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 05:25:12 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so1920611pbb.6
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2013 22:24:46 -0700 (PDT)
Message-ID: <1380777884.19002.155.camel@edumazet-glaptop.roam.corp.google.com>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 02 Oct 2013 22:24:44 -0700
In-Reply-To: <1380776994.2081.101.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
 <1380758954.2081.79.camel@joe-AO722> <1380760114.2081.81.camel@joe-AO722>
 <1380771110.2081.89.camel@joe-AO722> <1380771551.2081.93.camel@joe-AO722>
 <1380773924.19002.131.camel@edumazet-glaptop.roam.corp.google.com>
 <87fvsjynuk.fsf@kamboji.qca.qualcomm.com>
 <1380775478.19002.139.camel@edumazet-glaptop.roam.corp.google.com>
 <1380776994.2081.101.camel@joe-AO722>
Mime-Version: 1.0
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
To: Joe Perches <joe@perches.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev <netdev@vger.kernel.org>, "John W.
 Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@qca.qualcomm.com>

On Wed, 2013-10-02 at 22:09 -0700, Joe Perches wrote:
> On Wed, 2013-10-02 at 21:44 -0700, Eric Dumazet wrote:
> > I mean the 6, of course, since Joe seems to actively track them, as if
> > ETH_ALEN could change eventually, you never know.
> 
> You're funny Eric.
> You know it's just to ease grep pattern matching.

You are not funny if you plan to send 500+ patches for every instance of
6 changed to ETH_ALEN

I am not interested playing these grep games, honestly.

If you patch a driver, try to avoid sending one patch per line, that's
really not necessary, thank you.

If the structure definition uses [6], I see no reason to use ETH_ALEN in
the memset()/memcpy().

How is that funny, I don't know.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
