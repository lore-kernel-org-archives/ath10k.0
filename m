Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3gmk-0008MP-J1
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 07:55:11 +0000
Date: Wed, 24 Dec 2014 13:24:29 +0530
From: Rajkumar <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 8/8] ath10k: ath10k: add support to send delba
Message-ID: <20141224075426.GA17103@qca.qualcomm.com>
References: <1418972099-5296-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1418972099-5296-9-git-send-email-rmanohar@qti.qualcomm.com>
 <1419142431590.38389@qti.qualcomm.com>
 <87d27ag65n.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d27ag65n.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Dec 23, 2014 at 09:46:28AM +0200, Kalle Valo wrote:
> "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com> writes:
> 
> >> Subject: [PATCH 8/8] ath10k: ath10k: add support to send delba
> >> 
> >> This per-station debugfs entry helps to send delba in manual mode
> >> for debugging purpose. It accepts tid, initiator and reason code
> >> as inputs.
> > Kalle,
> >
> > Subject needs small correction (ath10k: ath10k:). Do you want
> > me send v2 patch for this change?
> 
> No need to send v2, I can do the change myself. But I noticed that you
> already sent it :)
> 
> But in the future please don't resubmit individual patches, that's just
> too error prone. Instead just resubmit the whole series.
> 
Agree... I will resend the whole series. Recently separate WMI ops for 10.2.4
is added. So newer WMI APIs has to be registered in 10.2.4 table.

Will send v2 series.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
