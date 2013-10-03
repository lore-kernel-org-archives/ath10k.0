Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRWU9-0002TM-AD
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 00:09:41 +0000
Message-ID: <1380758954.2081.79.camel@joe-AO722>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 17:09:14 -0700
In-Reply-To: <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
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
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>

On Thu, 2013-10-03 at 00:38 +0200, Julia Lawall wrote:
> 
> 
> On Wed, 2 Oct 2013, Joe Perches wrote:
> 
> > On Wed, 2013-10-02 at 10:44 -0700, Luis R. Rodriguez wrote:
> > > On Tue, Oct 1, 2013 at 11:40 PM, Joe Perches <joe@perches.com> wrote:
> > > > Please include netdev.  (cc'd)
> > > >
> > > >> Joe Perches <joe@perches.com> writes:
> > > >>
> > > >> > Convert the memset/memcpy uses of 6 to ETH_ALEN
> > > >> > where appropriate.
> > > >
> > > >> > Signed-off-by: Joe Perches <joe@perches.com>
> > > 
> > > I think these sorts of patches are good -- but once applied it'd be
> > > good if we can get the SmPL grammar expressed for it and then have
> > > developers / maintainers regularly doing:
> > > 
> > > make coccicheck MODE=patch M=path > path-cocci.patch
> > > 
> > > Unfortunately right now MODE=patch takes about 3 1/2 minutes for
> > > ath9k, MODE=org takes ~10 minutes for ath9k (17 minutes for all of
> > > ath/), and MODE=context takes ~8 minutes on ath9k -- I do believe its
> > > a bit unreasonable to expect patch submitters to use this, but
> > > certainly great practice. Some of the time differences on the reports
> > > can be explained by the fact that some SmPL will only be used for some
> > > modes.
> > > 
> > > Even though it takes a while right now it'd be great practice to use
> > > coccicheck to prevent these type of changes from going in again,
> > > things that checkpatch.pl won't be able to catch.
> > 
> > As far as I can tell, it's basically not possible for cocci to
> > do this conversion.
> 
> I tried looking for memcpys and memsets that do use ETH_ALEN and then 
> seeing what non-local functions the affected values flow to.  I then 
> marked all of the calls to memcpy and memset that use 6 where an affected 
> value flows to one of the functions identified in the first pass.  I get 
> 40 unique results on Linux 3.10.
> 
> The semantic patch is below.  It needs to be cleaned up to not return 
> duplicate results.  It needs to be run with the argument --no-show-diff, 
> and the result is printed in emacs org mode.

This has been running a _long_ time (broken?) on
drivers/net/ethernet/mellanox/mlx4/en_netdev.c

$ spatch --version
spatch version 1.0.0-rc14 without Python support and with PCRE support



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
