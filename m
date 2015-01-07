Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8sAF-0000C4-9n
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 15:04:53 +0000
Date: Wed, 7 Jan 2015 20:34:16 +0530
From: Rajkumar <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix build error when hwmon is off
Message-ID: <20150107150413.GA13894@qca.qualcomm.com>
References: <1419420240-11208-1-git-send-email-rmanohar@qti.qualcomm.com>
 <871tn6u0c5.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871tn6u0c5.fsf@kamboji.qca.qualcomm.com>
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

On Wed, Jan 07, 2015 at 04:33:46PM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Place hwmon APIs inside CONFIG_HWMON switch to fix undefined
> > errors when hwmon is not enabled.
> >
> > ERROR: "devm_hwmon_device_register_with_groups"
> > [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
> >
> > Reported-by: Kalle Valo <kvalo@qca.qualcomm.com>
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> Thanks, but this has too many ifdefs for my taste. I have another idea,
> let me send v2 shortly.
>
Got you ;)
Having seperate register/unregister APIs for hwmon ops reduce switches.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
