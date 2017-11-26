Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cvsmtppost012.nm.naver.com ([125.209.239.206])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eIr1E-0004eX-O7
 for ath10k@lists.infradead.org; Sun, 26 Nov 2017 07:06:27 +0000
MIME-Version: 1.0
Message-ID: <fb7021966cf8bb371e19f7f0be6caad@cweb12.nm.nhnsystem.com>
Date: Sun, 26 Nov 2017 16:05:57 +0900
From: =?utf-8?B?S3dhbmdNaW4gS2lt?=<kim25444@naver.com>
Subject: =?utf-8?B?YWJvdXQgbm9od2NyeXB0IGluIGF0aDEwayBwYXJhbWV0ZXI=?=
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: =?utf-8?B?S3dhbmdNaW4gS2lt?= <kim25444@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: gwondori@nimbus.kr

Using ath10k (backports-4.4.2, kernel-3.2.58), I got the same problem as the mailing list below.

http://lists.infradead.org/pipermail/ath10k/2016-October/008527.html

While collecting information on resolving this problem, I noticed that there is a nohwcrypt parameter on ath10k.

So I'm going to ask some questions.

    1. If I use this parameter (nohwcrypt), is there a difference in the authentication process?
        Or what is the difference between writing and not writing these parameters(nohwcrypt)?

    2. If I use this parameter (nohwcrypt), can I fix this? (When I look at the ath10k driver source it does not seem to have this problem.)

    3. If I use this parameter (nohwcrypt) under the assumption that all the available bandwidth is used at all times, how much performance loss do I have?


Best regards.

---

Kwang-Min Kim(kim25444@naver.com)

+821055216393
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
