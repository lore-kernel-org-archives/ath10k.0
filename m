Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailsrv5-bkp2.dondominio.net ([37.152.88.47]
 helo=mailsrv5.dondominio.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YanJY-0001eD-U9
 for ath10k@lists.infradead.org; Wed, 25 Mar 2015 15:34:01 +0000
Message-ID: <5512D58B.6030204@aoifes.com>
Date: Wed, 25 Mar 2015 16:34:35 +0100
From: Jose Antonio Delgado Alfonso <jose.delgado@aoifes.com>
MIME-Version: 1.0
Subject: Re: Dynamic channel Access
References: <CADxDmp50X2XnBjfk5qJKRH-n=1Cwagmjb_XyD+RJ4AgpPh-kjQ@mail.gmail.com>
 <CAEFj985wmiPwnF7rM1qCcO2K3X2yC_onO0AAMfm=9ytwpChzgg@mail.gmail.com>
 <etPan.542e8df5.6b8b4567.117@Okhwanui-Mac-mini.local>
 <55128DF0.6010109@aoifes.com>
In-Reply-To: <55128DF0.6010109@aoifes.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi all,

I would like to ask Qualcomm's collaborators about this topic.

We are trying to certify a AP product which uses QCA988x radio module.
We are using the ath10k driver (kernel v3.17.8) and firmware from Ben
Greear. We are trying to pass the Dynamic Channel test, which consists
in setting the radio at 80MHz and, at the same time, setting other
signal in the secondary channel. So far, the radio module does not
reduce the bandwidth and remains transmitting at 80MHz.

Please, Does someone know if Dynamic Channel Access is really supported
by ath10k driver in newest kernel versions?
Or, does it also depends on the firmware version?

Thanks in advance.

Regards,
Jose Delgado


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
