Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0241.hostedemail.com ([216.40.44.241]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRbB3-00085G-P4
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 05:10:18 +0000
Message-ID: <1380776994.2081.101.camel@joe-AO722>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 22:09:54 -0700
In-Reply-To: <1380775478.19002.139.camel@edumazet-glaptop.roam.corp.google.com>
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

On Wed, 2013-10-02 at 21:44 -0700, Eric Dumazet wrote:
> I mean the 6, of course, since Joe seems to actively track them, as if
> ETH_ALEN could change eventually, you never know.

You're funny Eric.
You know it's just to ease grep pattern matching.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
