Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb72y-0004cO-S8
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 12:05:49 +0000
Date: Mon, 6 Oct 2014 17:36:58 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/4] ath10k: Add support to configure pktlog filter
Message-ID: <20141006120656.GA19615@qca.qualcomm.com>
References: <1412269778-1045-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1412269778-1045-2-git-send-email-rmanohar@qti.qualcomm.com>
 <877g0dl8j6.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877g0dl8j6.fsf@kamboji.qca.qualcomm.com>
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

On Mon, Oct 06, 2014 at 02:52:45PM +0300, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Add support to configure packet log filters (tx, rx, rate control)
> > via debugfs. To disable htt pktlog events set the filters to 0.
> >
> > ex:
> >
> > To enable pktlog for all filters
> >
> >    echo 0x1f > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
> >
> > To disable pktlog
> >
> >    echo 0 > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
> >
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> I did minor changes to the error handling in
> ath10k_write_pktlog_filter() and in ath10k_debug_start(). Diff below and
> full commit here:
> 
> https://github.com/kvalo/ath/commit/470c43d83b7ee4147dea38a4f7b986070555a032
> 
> Please review my changes.
> 

LGTM. We need Michal's tracepoint changes other than pktlog. I do not have his
latest version of the change.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
