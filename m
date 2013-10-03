Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRcSg-0001QO-73
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 06:32:34 +0000
Date: Thu, 3 Oct 2013 08:32:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
In-Reply-To: <1380778451.2081.103.camel@joe-AO722>
Message-ID: <alpine.DEB.2.02.1310030824570.2006@localhost6.localdomain6>
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
 <1380777884.19002.155.camel@edumazet-glaptop.roam.corp.google.com>
 <1380778451.2081.103.camel@joe-AO722>
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
To: Joe Perches <joe@perches.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev <netdev@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

The following semantic patch fixes the type declarations.  It should be 
run with the argument --recursive-includes for best (but slowest) results.

julia

@@
identifier x;
expression e1;
type T;
@@

T x[
- 6
+ ETH_ALEN
];
... when any
(
memcpy(x,e1,ETH_ALEN)
|
memcpy(e1,x,ETH_ALEN)
|
memset(x,e1,ETH_ALEN)
)

@r@
type T,T1;
identifier x;
@@

T {
...
T1 x[6];
...
};

@s@
r.T *e;
identifier r.x;
expression e1;
@@

(
memcpy(e->x,e1,ETH_ALEN)
|
memcpy(e1,e->x,ETH_ALEN)
|
memset(e->x,e1,ETH_ALEN)
)

@depends on s@
type r.T,r.T1;
identifier r.x;
@@

T {
...
T1 x[
-6
+ ETH_ALEN
 ];
...
};

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
