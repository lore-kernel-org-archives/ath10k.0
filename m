Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDTIp-0002nN-D7
 for ath10k@lists.infradead.org; Sat, 02 Aug 2014 07:00:28 +0000
Message-ID: <1406962776.1835.3.camel@joe-AO725>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
From: Joe Perches <joe@perches.com>
Date: Fri, 01 Aug 2014 23:59:36 -0700
In-Reply-To: <87k36r5ra2.fsf@kamboji.qca.qualcomm.com>
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 <87k36r5ra2.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Sat, 2014-08-02 at 09:39 +0300, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
> > The 10.x and main firmware branches have
> > conflicting WMI service bitmap definitions.
> >
> > This also fixes WMI services parsing on big-endian
> > hosts and changes debugfs output to be more human
> > friendly.
> >
> > Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> 
> [...]
> 
> > +	SVCSTR(WMI_SERVICE_TX_ENCAP)
> > +	SVCSTR(WMI_SERVICE_BURST)
> > +	SVCSTR(WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT)
> > +	SVCSTR(WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT)
> >  	default:
> > -		return "UNKNOWN SERVICE\n";
> > +		return NULL;
> 
> This introduces a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath10k/wmi.h:214: ERROR: spaces required around that ':' (ctx:VxE)
> 
> But I think that's just a false warning and I should ignore it. Any
> other ideas?

I don't get a warning with this patch.

What's the last git commit id of the checkpatch version
you used?

$ ./scripts/checkpatch.pl --strict ath10k.diff  
total: 0 errors, 0 warnings, 0 checks, 471 lines checked



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
