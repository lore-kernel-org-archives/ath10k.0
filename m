Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXyf9-0008Lj-SD
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 23:13:37 +0000
Received: by mail-yw0-f171.google.com with SMTP id w75so46507571ywg.1
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 15:13:13 -0800 (PST)
MIME-Version: 1.0
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Mon, 30 Jan 2017 02:11:52 +0300
Message-ID: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
Subject: QCA988X firmware pull-push support
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
Cc: ath10k@lists.infradead.org

Hello,

I have started to play with intermediate software queues and suddenly
discovered that this code is completely disabled in ath10k for
firmware which does not support tx pull-push mode (QCA9880 in
particular).

So I would like to ask are there any plans for implementation of this
pull-push feature in QCA9880 firmware or I should consider my NIC
upgrade?

-- 
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
