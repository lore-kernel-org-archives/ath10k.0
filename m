Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzwO1-0006Wv-CD
 for ath10k@lists.infradead.org; Wed, 03 Jun 2015 00:18:26 +0000
From: "Li, Yanbo" <yanbol@qca.qualcomm.com>
Subject: RE: [PATCH v2] ath10k: Debugfs entry to enable/disable WLAN&Blutooth
 Coexist feature
Date: Wed, 3 Jun 2015 00:18:01 +0000
Message-ID: <641f79bf066d48b1b79f21a24eb0d0e2@nasanexm02e.na.qualcomm.com>
References: <1432840745-21725-1-git-send-email-yanbol@qca.qualcomm.com>
 <20150602113901.2da3542d@north>
In-Reply-To: <20150602113901.2da3542d@north>
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?iso-8859-2?Q?Jakub_Kici=F1ski?= <moorray3@wp.pl>
Cc: "dreamfly281@gmail.com" <dreamfly281@gmail.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



> -----Original Message-----
> From: Jakub Kici=F1ski [mailto:moorray3@wp.pl]
> Sent: Tuesday, June 02, 2015 2:39 AM
> To: Li, Yanbo
> Cc: Valo, Kalle; dreamfly281@gmail.com; ath10k@lists.infradead.org; linux-
> wireless@vger.kernel.org
> Subject: Re: [PATCH v2] ath10k: Debugfs entry to enable/disable
> WLAN&Blutooth Coexist feature
> =

> On Thu, 28 May 2015 12:19:05 -0700, Yanbo Li wrote:
> > As some radio have no connection with BT modules, enable the
> > WLAN/Bluetooth
> > coexist(BTC) feature will has some side effect if the radio's GPIO
> > connect with any other HW modules. Add the control switcher
> > "btc_feature" at debugfs and set the feature as disable by default to a=
void
> such case.
> >
> > To enable this feature, execute:
> > echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
> > To disable:
> > echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/btc_feature
> >
> > Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>
> =

> IMHO common API for disabling/enabling btcoex is something we would all
> benefit from and easy enough to implement properly.  Burying it in driver-
> specific debugfs is less than appropriate.
> =

> I seem to recall there were plans to discuss btcoex at one of the linux-
> wireless summits.  If the consensus was to leave it in debugfs then I
> apologize for the noise ;)

Thanks for your comments, agree with a general BTcoex interface will be goo=
d for lots of wlan chip/driver. =

It worth to be consider to implement such framework in future.

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
