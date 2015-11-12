Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwy63-0007mn-Ap
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 20:03:52 +0000
Message-ID: <1447358605.2131.3.camel@sipsolutions.net>
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 12 Nov 2015 21:03:25 +0100
In-Reply-To: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Thu, 2015-11-12 at 09:59 -0800, Peter Oh wrote:
> Add NL80211_EXT_FEATURE_VHT_MESH flag to allow drivers
> to indicate support for VHT in Mesh mode.
> This flag will be used by wireless drivers to indicate
> the capability of VHT Mesh support and wpa_supplicant to inspect
> wireless drivers' capability of VHT Mesh.
> In addition to this patch, separate patches to ath10k driver and
> wpa_supplicant are also sent out.
> 
Sorry, still doesn't make sense. What does userspace even need to know
this *for*?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
