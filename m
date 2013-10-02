Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0162.hostedemail.com ([216.40.44.162]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRQlc-0001yc-KC
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 18:03:21 +0000
Message-ID: <1380736969.2081.72.camel@joe-AO722>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 11:02:49 -0700
In-Reply-To: <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
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
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, netdev <netdev@vger.kernel.org>

On Wed, 2013-10-02 at 10:44 -0700, Luis R. Rodriguez wrote:
> On Tue, Oct 1, 2013 at 11:40 PM, Joe Perches <joe@perches.com> wrote:
> > Please include netdev.  (cc'd)
> >
> >> Joe Perches <joe@perches.com> writes:
> >>
> >> > Convert the memset/memcpy uses of 6 to ETH_ALEN
> >> > where appropriate.
> >
> >> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> I think these sorts of patches are good -- but once applied it'd be
> good if we can get the SmPL grammar expressed for it and then have
> developers / maintainers regularly doing:
> 
> make coccicheck MODE=patch M=path > path-cocci.patch
> 
> Unfortunately right now MODE=patch takes about 3 1/2 minutes for
> ath9k, MODE=org takes ~10 minutes for ath9k (17 minutes for all of
> ath/), and MODE=context takes ~8 minutes on ath9k -- I do believe its
> a bit unreasonable to expect patch submitters to use this, but
> certainly great practice. Some of the time differences on the reports
> can be explained by the fact that some SmPL will only be used for some
> modes.
> 
> Even though it takes a while right now it'd be great practice to use
> coccicheck to prevent these type of changes from going in again,
> things that checkpatch.pl won't be able to catch.

As far as I can tell, it's basically not possible for cocci to
do this conversion.

There are other memcpy/memset uses with size_t = 6 where it's
not a MAC address being copied.

The call site has to be inspected to determine if the copied
to address is used as a MAC address or not.

Maybe if there was some typedef like:

typedef u8 eth_addr_t[ETH_ALEN];

There are a few of these already in use:

$ git grep "typedef.*\[" | grep -P "\[\s*(?:ETH_ALEN|6)\s*\]"
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h:typedef u8 bnx2x_mac_addr_t[ETH_ALEN];
drivers/net/ethernet/brocade/bna/cna.h:typedef struct mac { u8 mac[ETH_ALEN]; } mac_t;
drivers/net/ethernet/via/via-velocity.h:typedef u8 MCAM_ADDR[ETH_ALEN];
drivers/net/usb/kaweth.c:typedef __u8 eth_addr_t[6];
drivers/net/wireless/ray_cs.c:typedef u_char mac_addr[ETH_ALEN];	/* Hardware address */
drivers/staging/vt6655/wmgr.h:typedef unsigned char NDIS_802_11_MAC_ADDRESS[6];
drivers/staging/vt6656/wmgr.h:typedef u8 NDIS_802_11_MAC_ADDRESS[ETH_ALEN];



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
