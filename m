Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRc4o-0000u5-5n
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 06:07:55 +0000
Message-ID: <1380780437.2081.106.camel@joe-AO722>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 23:07:17 -0700
In-Reply-To: <1380780021.19002.164.camel@edumazet-glaptop.roam.corp.google.com>
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
 <1380780021.19002.164.camel@edumazet-glaptop.roam.corp.google.com>
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev <netdev@vger.kernel.org>, "John W.
 Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@qca.qualcomm.com>

On Wed, 2013-10-02 at 23:00 -0700, Eric Dumazet wrote:
> On Wed, 2013-10-02 at 22:34 -0700, Joe Perches wrote:
> > https://lkml.org/lkml/2013/10/1/517
> I had no problem with this one.
> Did I say something (funny or not) about it ?

Nope, you didn't say anything publicly or
even privately to me.

> Apparently you mix things and you do not like me commenting or giving a
> feedback on a _particular_ patch.

Feedback like expecting 500 individual patches
when you apparently saw one that modified 57 files
with multiple maintainers _is_ pretty funny.

cheers, Joe


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
