Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x230.google.com ([2607:f8b0:4002:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cklIq-0007em-Qt
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 05:35:26 +0000
Received: by mail-yw0-x230.google.com with SMTP id o4so50797909ywd.3
 for <ath10k@lists.infradead.org>; Sun, 05 Mar 2017 21:35:02 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5a2Z5bu65biM?= <ycsunjane@gmail.com>
Date: Mon, 6 Mar 2017 13:35:01 +0800
Message-ID: <CABWe71w6DFo_p2n+83wcUTX9eNhoELv6mXEDUvnYOEMJeLpnaA@mail.gmail.com>
Subject: ar9003 family unknown registers description
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
To: ath10k@lists.infradead.org

hi,
    I sent an email to this mailing list to take a chance to see if
anyone knows some of the ath9k drivers. I can not find the ath9k
mailing list.

    I am reading ath9k driver code. My chip is ar9331 which is ar9003
family. I am confused by some registers in ar9003_phy.h. In ar9331
datasheet many registers are reserved.

e.g:

/*
 * Channel Register Map
*/
#define AR_CHAN_BASE    0x9800

/*
 * MRC Register Map
 */
#define AR_MRC_BASE     0x9c00

The  ATH9K_INT_BB_WATCHDOG bits of ISR_S2 is also reserved.

Is there something i miss? And how can i get full register description
datasheet?

Regards

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
