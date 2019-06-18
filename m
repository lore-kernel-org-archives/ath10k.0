Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdCad-0000kA-BB
 for ath10k@lists.infradead.org; Tue, 18 Jun 2019 11:47:52 +0000
Date: Tue, 18 Jun 2019 14:47:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [ath6kl:pending-ath11k 198/205]
 drivers/net/wireless/ath/ath11k/mac.c:1274 ath11k_peer_assoc_h_he() error:
 memcpy() 'he_cap->he_cap_elem.mac_cap_info' too small (6 vs 8)
Message-ID: <20190618114732.GD18776@kadam>
References: <20190618065329.GY1893@kadam>
 <be8949ff-7ac2-3570-05ec-342036a6f52e@phrozen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be8949ff-7ac2-3570-05ec-342036a6f52e@phrozen.org>
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
To: John Crispin <john@phrozen.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild@01.org, kbuild test robot <lkp@intel.com>, ath10k@lists.infradead.org, kbuild-all@01.org

On Tue, Jun 18, 2019 at 08:59:55AM +0200, John Crispin wrote:
> 
> On 18/06/2019 08:53, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-ath11k
> > head:   0f82fec5679664bb91d6c167fd1a146f113e4197
> > commit: cbdb3159fdf450b7b3999a06600aa0e1fb78383f [198/205] ath11k: set additional values inside wmi_peer_assoc_complete_cmd
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > New smatch warnings:
> > drivers/net/wireless/ath/ath11k/mac.c:1274 ath11k_peer_assoc_h_he() error: memcpy() 'he_cap->he_cap_elem.mac_cap_info' too small (6 vs 8)
> > 
> > Old smatch warnings:
> > drivers/net/wireless/ath/ath11k/mac.c:1276 ath11k_peer_assoc_h_he() error: memcpy() 'he_cap->he_cap_elem.phy_cap_info' too small (11 vs 12)
> > 
> > # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=cbdb3159fdf450b7b3999a06600aa0e1fb78383f
> > git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> > git remote update ath6kl
> > git checkout cbdb3159fdf450b7b3999a06600aa0e1fb78383f
> > vim +1274 drivers/net/wireless/ath/ath11k/mac.c
> > 
> > 258bbf52 Kalle Valo   2019-02-05  1260
> > 258bbf52 Kalle Valo   2019-02-05  1261  static void ath11k_peer_assoc_h_he(struct ath11k *ar,
> > 258bbf52 Kalle Valo   2019-02-05  1262  				   struct ieee80211_vif *vif,
> > 258bbf52 Kalle Valo   2019-02-05  1263  				   struct ieee80211_sta *sta,
> > 258bbf52 Kalle Valo   2019-02-05  1264  				   struct peer_assoc_params *arg)
> > 258bbf52 Kalle Valo   2019-02-05  1265  {
> > 17aca2d9 John Crispin 2019-06-03  1266  	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
> > 3db59a23 Kalle Valo   2019-06-12  1267  	u16 v;
> > 17aca2d9 John Crispin 2019-06-03  1268
> > 17aca2d9 John Crispin 2019-06-03  1269  	if (!he_cap->has_he)
> > 17aca2d9 John Crispin 2019-06-03  1270  		return;
> > 17aca2d9 John Crispin 2019-06-03  1271
> > 17aca2d9 John Crispin 2019-06-03  1272  	arg->he_flag = true;
> > 17aca2d9 John Crispin 2019-06-03  1273
> > 17aca2d9 John Crispin 2019-06-03 @1274  	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
> > 17aca2d9 John Crispin 2019-06-03  1275  	       sizeof(arg->peer_he_cap_macinfo));
> > 
> > Smatch thinks these are different sizes...  I don't have a copy of
> > struct peer_assoc_params so I can't check.
> 
> Hi,
> 
> its he_cap->he_cap_elem.mac_cap_info[6] and arg->peer_he_cap_macinfo[2] and we only copy the first 2 elements as the FW only cares for the first 2 bytes.
> 

I did download the latest git.  The problem is that
he_cap->he_cap_elem.mac_cap_info[] is six bytes and arg->peer_he_cap_macinfo[]
is two u32s or eight bytes.  So we are reading beyond the end of the
array.

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
