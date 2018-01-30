Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egcHx-0003JH-6q
 for ath10k@lists.infradead.org; Tue, 30 Jan 2018 20:13:56 +0000
Date: Tue, 30 Jan 2018 23:12:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 12/14] drivers/net/wireless/ath/ath9k/calib.c:270
 ath9k_hw_loadnf() error: buffer overflow 'ath9k_hw_get_nf_limits(ah,
 chan)->cal' 3 <= 5
Message-ID: <20180130201229.v7ppszuht5umj46x@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: kbuild@01.org, Wojciech Dubowik <Wojciech.Dubowik@neratec.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   e5ff4344eab68c86e00036e937847ce89dfaeef6
commit: 15511de6d14c8b947499c3546a40181221b272fe [12/14] ath9k: Use calibrated noise floor value when available

smatch warnings:
drivers/net/wireless/ath/ath9k/calib.c:270 ath9k_hw_loadnf() error: buffer overflow 'ath9k_hw_get_nf_limits(ah, chan)->cal' 3 <= 5

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=15511de6d14c8b947499c3546a40181221b272fe
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 15511de6d14c8b947499c3546a40181221b272fe
vim +270 drivers/net/wireless/ath/ath9k/calib.c

f1dc56003 drivers/net/wireless/ath9k/calib.c     Sujith             2008-10-29  242  
7b8aaead9 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2014-10-25  243  int ath9k_hw_loadnf(struct ath_hw *ah, struct ath9k_channel *chan)
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  244  {
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  245  	struct ath9k_nfcal_hist *h = NULL;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  246  	unsigned i, j;
487f0e010 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-23  247  	u8 chainmask = (ah->rxchainmask << 3) | ah->rxchainmask;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  248  	struct ath_common *common = ath9k_hw_common(ah);
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  249  	s16 default_nf = ath9k_hw_get_nf_limits(ah, chan)->nominal;
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  250  	u32 bb_agc_ctl = REG_READ(ah, AR_PHY_AGC_CONTROL);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  251  
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  252  	if (ah->caldata)
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  253  		h = ah->caldata->nfCalHist;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  254  
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  255  	ENABLE_REG_RMW_BUFFER(ah);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  256  	for (i = 0; i < NUM_NF_READINGS; i++) {
                                                                                                    ^^^^^^^^^^^^^^^^^^^^
i < 6

bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  257  		if (chainmask & (1 << i)) {
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  258  			s16 nfval;
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  259  
e4744ec78 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2013-10-11  260  			if ((i >= AR5416_MAX_CHAINS) && !IS_CHAN_HT40(chan))
                                                                                                             ^^^^^^^^^^^^^^^^^^^^^^^
This is a limit test, but the "&& !IS_CHAN_HT40(chan)" means that i can
be up to 5.

28ef6450f drivers/net/wireless/ath/ath9k/calib.c Rajkumar Manoharan 2011-05-04  261  				continue;
28ef6450f drivers/net/wireless/ath/ath9k/calib.c Rajkumar Manoharan 2011-05-04  262  
b90189759 drivers/net/wireless/ath/ath9k/calib.c Simon Wunderlich   2017-03-23  263  			if (ah->nf_override)
b90189759 drivers/net/wireless/ath/ath9k/calib.c Simon Wunderlich   2017-03-23  264  				nfval = ah->nf_override;
b90189759 drivers/net/wireless/ath/ath9k/calib.c Simon Wunderlich   2017-03-23  265  			else if (h)
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  266  				nfval = h[i].privNF;
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  267  			else {
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  268  				/* Try to get calibrated noise floor value */
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  269  				nfval =
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24 @270  				    ath9k_hw_get_nf_limits(ah, chan)->cal[i];
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  271  				if (nfval > -60 || nfval < -127)
20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  272  					nfval = default_nf;
15511de6d drivers/net/wireless/ath/ath9k/calib.c Wojciech Dubowik   2018-01-24  273  			}


Perhaps the !IS_CHAN_HT40(chan) means that ->nf_override is or that
"h" is non-NULL..  I don't know the driver well enought to say.

20bd2a095 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-31  274  
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  275  			REG_RMW(ah, ah->nf_regs[i],
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  276  				(((u32) nfval << 1) & 0x1ff), 0x1ff);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  277  		}
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  278  	}
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  279  
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  280  	/*
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  281  	 * stop NF cal if ongoing to ensure NF load completes immediately
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  282  	 * (or after end rx/tx frame if ongoing)
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  283  	 */
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  284  	if (bb_agc_ctl & AR_PHY_AGC_CONTROL_NF) {
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  285  		REG_CLR_BIT(ah, AR_PHY_AGC_CONTROL, AR_PHY_AGC_CONTROL_NF);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  286  		REG_RMW_BUFFER_FLUSH(ah);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  287  		ENABLE_REG_RMW_BUFFER(ah);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  288  	}
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  289  
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  290  	/*
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  291  	 * Load software filtered NF value into baseband internal minCCApwr
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  292  	 * variable.
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  293  	 */
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  294  	REG_CLR_BIT(ah, AR_PHY_AGC_CONTROL,
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  295  		    AR_PHY_AGC_CONTROL_ENABLE_NF);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  296  	REG_CLR_BIT(ah, AR_PHY_AGC_CONTROL,
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  297  		    AR_PHY_AGC_CONTROL_NO_UPDATE_NF);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  298  	REG_SET_BIT(ah, AR_PHY_AGC_CONTROL, AR_PHY_AGC_CONTROL_NF);
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  299  	REG_RMW_BUFFER_FLUSH(ah);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  300  
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  301  	/*
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  302  	 * Wait for load to complete, should be fast, a few 10s of us.
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  303  	 * The max delay was changed from an original 250us to 22.2 msec.
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  304  	 * This would increase timeout to the longest possible frame
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  305  	 * (11n max length 22.1 msec)
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  306  	 */
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  307  	for (j = 0; j < 22200; j++) {
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  308  		if ((REG_READ(ah, AR_PHY_AGC_CONTROL) &
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  309  			      AR_PHY_AGC_CONTROL_NF) == 0)
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  310  			break;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  311  		udelay(10);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  312  	}
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  313  
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  314  	/*
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  315  	 * Restart NF so it can continue.
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  316  	 */
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  317  	if (bb_agc_ctl & AR_PHY_AGC_CONTROL_NF) {
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  318  		ENABLE_REG_RMW_BUFFER(ah);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  319  		if (bb_agc_ctl & AR_PHY_AGC_CONTROL_ENABLE_NF)
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  320  			REG_SET_BIT(ah, AR_PHY_AGC_CONTROL,
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  321  				    AR_PHY_AGC_CONTROL_ENABLE_NF);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  322  		if (bb_agc_ctl & AR_PHY_AGC_CONTROL_NO_UPDATE_NF)
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  323  			REG_SET_BIT(ah, AR_PHY_AGC_CONTROL,
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  324  				    AR_PHY_AGC_CONTROL_NO_UPDATE_NF);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  325  		REG_SET_BIT(ah, AR_PHY_AGC_CONTROL, AR_PHY_AGC_CONTROL_NF);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  326  		REG_RMW_BUFFER_FLUSH(ah);
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  327  	}
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  328  
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  329  	/*
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  330  	 * We timed out waiting for the noisefloor to load, probably due to an
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  331  	 * in-progress rx. Simply return here and allow the load plenty of time
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  332  	 * to complete before the next calibration interval.  We need to avoid
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  333  	 * trying to load -50 (which happens below) while the previous load is
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  334  	 * still in progress as this can cause rx deafness. Instead by returning
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  335  	 * here, the baseband nf cal will just be capped by our present
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  336  	 * noisefloor until the next calibration timer.
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  337  	 */
82def495d drivers/net/wireless/ath/ath9k/calib.c Miaoqing Pan       2016-02-05  338  	if (j == 22200) {
d2182b69d drivers/net/wireless/ath/ath9k/calib.c Joe Perches        2011-12-15  339  		ath_dbg(common, ANY,
226afe68f drivers/net/wireless/ath/ath9k/calib.c Joe Perches        2010-12-02  340  			"Timeout while waiting for nf to load: AR_PHY_AGC_CONTROL=0x%x\n",
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  341  			REG_READ(ah, AR_PHY_AGC_CONTROL));
7b8aaead9 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2014-10-25  342  		return -ETIMEDOUT;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  343  	}
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  344  
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  345  	/*
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  346  	 * Restore maxCCAPower register parameter again so that we're not capped
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  347  	 * by the median we just loaded.  This will be initial (and max) value
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  348  	 * of next noise floor calibration the baseband does.
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  349  	 */
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  350  	ENABLE_REG_RMW_BUFFER(ah);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  351  	for (i = 0; i < NUM_NF_READINGS; i++) {
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  352  		if (chainmask & (1 << i)) {
e4744ec78 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2013-10-11  353  			if ((i >= AR5416_MAX_CHAINS) && !IS_CHAN_HT40(chan))
28ef6450f drivers/net/wireless/ath/ath9k/calib.c Rajkumar Manoharan 2011-05-04  354  				continue;
28ef6450f drivers/net/wireless/ath/ath9k/calib.c Rajkumar Manoharan 2011-05-04  355  
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  356  			REG_RMW(ah, ah->nf_regs[i],
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  357  					(((u32) (-50) << 1) & 0x1ff), 0x1ff);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  358  		}
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  359  	}
9830ba6c9 drivers/net/wireless/ath/ath9k/calib.c Oleksij Rempel     2015-03-22  360  	REG_RMW_BUFFER_FLUSH(ah);
7b8aaead9 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2014-10-25  361  
7b8aaead9 drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2014-10-25  362  	return 0;
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  363  }
b90189759 drivers/net/wireless/ath/ath9k/calib.c Simon Wunderlich   2017-03-23  364  EXPORT_SYMBOL(ath9k_hw_loadnf);
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  365  
bbacee13f drivers/net/wireless/ath/ath9k/calib.c Felix Fietkau      2010-07-11  366  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
