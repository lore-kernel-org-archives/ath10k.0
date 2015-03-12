Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW3S0-0007Fr-9C
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 13:47:01 +0000
Date: Thu, 12 Mar 2015 19:16:21 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: add symlink for hwmon device
Message-ID: <20150312134618.GA3305@qca.qualcomm.com>
References: <1424437452-28161-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1424437452-28161-3-git-send-email-rmanohar@qti.qualcomm.com>
 <87pp8gyi7x.fsf@kamboji.qca.qualcomm.com>
 <20150310164223.GA11700@qca.qualcomm.com>
 <878uf2uzby.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878uf2uzby.fsf@kamboji.qca.qualcomm.com>
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

On Thu, Mar 12, 2015 at 03:20:33PM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > On Tue, Mar 10, 2015 at 05:39:46PM +0200, Kalle Valo wrote:
> >> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> >> 
> >> > Add symbloic link "thermal_sensors" for hwmon devices for better
> >> > readability.
> >> >
> >> > /sys/class/ieee80211/phyX/device/thermal_sensors ->
> >> > sys/class/ieee80211/phyX/device/hwmon/hwmonY
> >> 
> >> I don't get it, how does that improve readability? Also I don't see any
> >> other driver doing this, so isn't this just some private hack and not a
> >> proper generic interface?
> >
> > The patch is providing same level access to monitoring device similar to
> > cooling device.
> >
> > cooling_device -> ../../../../../virtual/thermal/cooling_deviceX
> > thermal_sensors -> hwmon/hwmonX
> 
> Is this documented somewhere? We cannot just start inventing sysfs
> interfaces on our own.
>
Agree. this is not a standard interface. I added symlink just to provide
user readable name instead of hwmon. Please drop this change, if it does
not add any values to existing interface.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
