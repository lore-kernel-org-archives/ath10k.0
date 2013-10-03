Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0062.hostedemail.com ([216.40.44.62]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRaxn-0007gs-RO
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 04:56:36 +0000
Message-ID: <1380776161.2081.99.camel@joe-AO722>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 21:56:01 -0700
In-Reply-To: <1380773924.19002.131.camel@edumazet-glaptop.roam.corp.google.com>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
 <1380758954.2081.79.camel@joe-AO722> <1380760114.2081.81.camel@joe-AO722>
 <1380771110.2081.89.camel@joe-AO722> <1380771551.2081.93.camel@joe-AO722>
 <1380773924.19002.131.camel@edumazet-glaptop.roam.corp.google.com>
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

On Wed, 2013-10-02 at 21:18 -0700, Eric Dumazet wrote:
> On Wed, 2013-10-02 at 20:39 -0700, Joe Perches wrote:
> > Use the appropriate define instead of 6.
[]
> I don't get it.
> Why leaving this then ?
> 
> struct wmi_mac_addr {
>         union {
>                 u8 addr[6];
>                 struct {
>                         u32 word0;
>                         u32 word1;
>                 } __packed;
>         } __packed;
> } __packed;

'cause I just did the ones I noticed around the memcpy/memset
grep pattern I used.

$ grep -rP --include=*.[ch] -n "\b(memset|memcpy)\s*\([^,]+,[^,]+,\s*6\s*\)" drivers/net

You're welcome to look for all the [6] uses and convert the
appropriate ones too.  Maybe use that eth_addr_t typedef.

$ git grep -E "\[\s*6\s*\]\s*;" drivers/net/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
