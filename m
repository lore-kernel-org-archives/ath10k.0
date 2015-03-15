Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YX3uE-00072l-H4
 for ath10k@lists.infradead.org; Sun, 15 Mar 2015 08:28:18 +0000
Date: Sun, 15 Mar 2015 13:57:36 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: move driver state check before setting throttle
Message-ID: <20150315082734.GD18213@qca.qualcomm.com>
References: <1426097094-6225-1-git-send-email-rmanohar@qti.qualcomm.com>
 <873858rgh6.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <873858rgh6.fsf@kamboji.qca.qualcomm.com>
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

On Fri, Mar 13, 2015 at 06:48:21PM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Since thermal daemon is unaware of the device state, it might
> > try to adjust the throttle state when the device is powered down.
> > So the driver caches the value and will configure it while
> > powering up the target. The cached value will be programed later
> > once the device is brought up. In such case, returning error
> > status is confusing and misleading the user application. Hence
> > moving the driver state check before sending wmi command to target.
> >
> > Reported-by: Matthias Kaehlcke <mka@google.com>
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> What tree do you use as the baseline? Three-way merge doesn't work as
> sha1 ids are not found:
> 
Will send rebased version.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
