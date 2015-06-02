Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzifU-00059n-MZ
 for ath10k@lists.infradead.org; Tue, 02 Jun 2015 09:39:33 +0000
Date: Tue, 2 Jun 2015 11:39:01 +0200
From: Jakub =?UTF-8?B?S2ljacWEc2tp?= <moorray3@wp.pl>
Subject: Re: [PATCH v2] ath10k: Debugfs entry to enable/disable
 WLAN&Blutooth Coexist feature
Message-ID: <20150602113901.2da3542d@north>
In-Reply-To: <1432840745-21725-1-git-send-email-yanbol@qca.qualcomm.com>
References: <1432840745-21725-1-git-send-email-yanbol@qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qca.qualcomm.com>
Cc: dreamfly281@gmail.com, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, 28 May 2015 12:19:05 -0700, Yanbo Li wrote:
> As some radio have no connection with BT modules, enable the WLAN/Bluetooth
> coexist(BTC) feature will has some side effect if the radio's GPIO connect
> with any other HW modules. Add the control switcher "btc_feature" at
> debugfs and set the feature as disable by default to avoid such case.
>
> To enable this feature, execute:
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
> To disable:
> echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
> 
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

IMHO common API for disabling/enabling btcoex is something we would all
benefit from and easy enough to implement properly.  Burying it in
driver-specific debugfs is less than appropriate.

I seem to recall there were plans to discuss btcoex at one of the
linux-wireless summits.  If the consensus was to leave it in debugfs
then I apologize for the noise ;)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
