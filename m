Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGlXe-0003N5-6r
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 14:28:03 +0000
Received: by mail-oi1-x235.google.com with SMTP id x188so20163296oia.13
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 07:28:01 -0700 (PDT)
MIME-Version: 1.0
From: Fredrik Olofsson <fredrik.olofsson@anyfinetworks.com>
Date: Wed, 17 Apr 2019 16:27:50 +0200
Message-ID: <CADiFmNM_6wE=ar_fgsNFk-6mBxPQNf9sq0rQH-vjsvqCz8L89w@mail.gmail.com>
Subject: Frame injection in wave 2 chipsets?
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

We are developing a product using split mac to distribute a WiFi
network over several different access points. The implementation
forwards the encrypted 802.11 frames over the ethernet to a gateway
where the 802.11 network is terminated (no enctyption keys for the
802.11 network are available in the access point). For this to work,
we use monitor mode and frame injection to receive and send frames to
the driver in a modified OpenWrt firmware. This works fine on ath9k,
and on ath10k wave 1 chipsets (e.g. Archer C7 with firmware QCA988X
ver 10.2.4-1.0-00041, rawmode=1).

However, using ath10k wave 2 chipsets injecting encrypted frames on a
monitor interface does not work, they are silently dropped by the
firmware. I have not been able to locate any firmware supporting
rawmode which I believe would allow this.

Does any way of injecting encrypted frames currently exist on ath10k
for wave 2 chipsets?

Thanks for any help
/Fredrik
-- 
Fredrik Olofsson, M.Sc.
Senior Engineer | E fredrik.olofsson@anyfinetworks.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
