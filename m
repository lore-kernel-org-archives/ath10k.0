Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVNPy-0008Lb-0Y
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 16:54:06 +0000
Date: Tue, 10 Mar 2015 22:23:24 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: add sysfs entry to configure quiet period
Message-ID: <20150310165323.GB11700@qca.qualcomm.com>
References: <1424437452-28161-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87lhj4yi0x.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lhj4yi0x.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Mar 10, 2015 at 05:43:58PM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Add support to configure quiet period via sysfs entry. This will
> > be helpful to experiment different quiet period values along with
> > different duty cycle ratio.
> >
> > To configure quiet period as 30ms,
> >
> > echo 30 >/sys/class/ieee80211/phyX/device/quiet_period
> 
> What's the justification? To me this looks like an ugly driver private
> hack. Why can't you use nl80211 or something else?

As this is purely for testing purpose to play around with different
quiet period along with various throttling state, sysfs entry is used
instead of netlink testmode command. Instead of debugfs, sysfs entry is
selected to align with existing thermal interface. 

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
