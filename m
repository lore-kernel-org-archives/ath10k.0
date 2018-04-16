Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f84fl-00044x-G4
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 13:59:59 +0000
Received: by mail-vk0-x22f.google.com with SMTP id x204so9507590vkd.7
 for <ath10k@lists.infradead.org>; Mon, 16 Apr 2018 06:59:46 -0700 (PDT)
MIME-Version: 1.0
From: "ojab //" <ojab@ojab.ru>
Date: Mon, 16 Apr 2018 13:59:44 +0000
Message-ID: <CAKzrAgQMOb7c+ayZKTgeq9B5YhCfPZ1EjrMjvB1UpaxeAEZXsw@mail.gmail.com>
Subject: Compex WLE1216V2-20 (QCA9984) firmware is missing
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

[please CC me since I'm not subscribed to the lists and terribly sorry
for HTML mails]

Oh hai!

I have Compex WLE1216V2-20 (based on QCA9984 chip) that isn't
supported by linux-firmware (git master), card init fails with

>[Mon Mar 26 17:18:47 2018] ath10k_pci 0000:05:00.0: failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=30 from ath10k/QCA9984/hw1.0/board-2.bin

It works fine with board-2.bin from the compex website [1] (can be
downloaded directly from
https://bugzilla.kernel.org/attachment.cgi?id=274959).
What should be done to have it upstreamed?

[1] https://downloads.compex.com.sg/?dir=uploads/boardData/For_Building_New_Firmware

//wbr ojab

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
