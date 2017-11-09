Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCpAZ-00032n-Fe
 for ath10k@lists.infradead.org; Thu, 09 Nov 2017 15:55:10 +0000
Received: by mail-qt0-x22a.google.com with SMTP id 8so8213091qtv.1
 for <ath10k@lists.infradead.org>; Thu, 09 Nov 2017 07:54:45 -0800 (PST)
MIME-Version: 1.0
From: Andy Finkel <afinkel@rajant.com>
Date: Thu, 9 Nov 2017 10:54:43 -0500
Message-ID: <CADNAk12vdgq7LuD=3jJXJ0_8i19bv-KK0x7Mnbez24TRVT+FyA@mail.gmail.com>
Subject: QCA9887 firmware and WDS question
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

I'm trying to get an ath10k QCA9887 based radio working with WDS
stations.  Does anyone know if  firmware-5.bin_10.2.4-1.0-00029
supports WDS ?

The driver works fine using the QCA9887 card as an AP;

The same driver, running a QCA9882 based radio card works as a WDS
station, as well as an AP.

Is there a firmware version for the QCA9887 known to support WDS ?  If
so, I could test with that, and know any problems are in the driver.

Thanks,

Andy

--
Andy Finkel
Rajant Corp.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
