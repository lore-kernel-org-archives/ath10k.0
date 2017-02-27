Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciIdG-0000te-16
 for ath10k@lists.infradead.org; Mon, 27 Feb 2017 10:34:19 +0000
From: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Subject: RE: [PATCHv2 0/4] cfg80211: mac80211: BTCOEX feature support
Date: Mon, 27 Feb 2017 10:33:50 +0000
Message-ID: <97411eac047e4516b757d432c27cfacd@aphydexm01f.ap.qualcomm.com>
References: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
 <d8f813bb-fd25-9957-360e-7aa4cd117822@broadcom.com>
In-Reply-To: <d8f813bb-fd25-9957-360e-7aa4cd117822@broadcom.com>
Content-Language: en-US
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Arend,

> >
> > This patchset add support for BTCOEX feature to enable/disable and
> > modifying btcoex priority value via nl80211
> >
> > Tamizh chelvam (4):
> >   ath10k: Add support to enable or disable btcoex via nl80211
> >   ath10k: Add support to update btcoex priority value via nl80211
> >   dt: bindings: add new dt entry for BTCOEX feature in qcom,ath10k.txt
> >   ath10k: Add support to read btcoex related data from DT
> 
> This cover letter does not seem to reflect the other patches that were sent to
> the wireless list as those are about cfg80211/mac80211; not ath10k?

[Tamizh] ath10k patches are under progress, will send it soon.

> 
> Regards,
> Arend
> 
> > v2 :
> >   * Introduced NL80211_CMD_SET_BTCOEX to enable/disable btcoex and
> >     to set/modify btcoex_priority.
> >   * Added bool variable in wiphy structure to advertise btcoex_priority
> >     feature and removed BITMAP calculation for btcoex_priority value.
> >
> >  .../bindings/net/wireless/qcom,ath10k.txt          |    4 +
> >  drivers/net/wireless/ath/ath10k/core.c             |   44 ++++++++-
> >  drivers/net/wireless/ath/ath10k/core.h             |    9 ++
> >  drivers/net/wireless/ath/ath10k/debug.c            |   40 ++-------
> >  drivers/net/wireless/ath/ath10k/mac.c              |   94
> +++++++++++++++++++-
> >  drivers/net/wireless/ath/ath10k/mac.h              |    1 +
> >  drivers/net/wireless/ath/ath10k/wmi-ops.h          |   19 ++++
> >  drivers/net/wireless/ath/ath10k/wmi.c              |   20 +++++
> >  drivers/net/wireless/ath/ath10k/wmi.h              |   20 +++++
> >  9 files changed, 215 insertions(+), 36 deletions(-)
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
