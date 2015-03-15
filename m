Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YX3o0-0005Dn-8K
 for ath10k@lists.infradead.org; Sun, 15 Mar 2015 08:21:53 +0000
Date: Sun, 15 Mar 2015 13:51:13 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k: Fix interpretation of cooling device state
Message-ID: <20150315082112.GB18213@qca.qualcomm.com>
References: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87d24gyhbc.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d24gyhbc.fsf@kamboji.qca.qualcomm.com>
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
Cc: Matthias Kaehlcke <mka@google.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Mar 10, 2015 at 05:59:19PM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Setting the sysfs attribute ends up configuring the duty cycle,
> > but the interface through which the attribute is exposed
> > (cooling_device) is for setting the throttle/cooling state. This
> > is confusing the user. Hence renaming the cooling device interfaces
> > for better readability.
> >
> > Cc: Matthias Kaehlcke <mka@google.com>
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> The four patches don't apply for some reason, please rebase.
>
Sure. Will send v2 patchset.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
