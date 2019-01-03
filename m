Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf4Ty-0000ap-6n
 for ath10k@lists.infradead.org; Thu, 03 Jan 2019 15:00:27 +0000
Received: by mail-lj1-x235.google.com with SMTP id q2-v6so29910950lji.10
 for <ath10k@lists.infradead.org>; Thu, 03 Jan 2019 07:00:25 -0800 (PST)
MIME-Version: 1.0
From: Richard Toy <richard.toy@gmail.com>
Date: Thu, 3 Jan 2019 15:59:48 +0100
Message-ID: <CAK3eJOABrJyjifD5-cmaDu4U7XPHdwNdJ81jX++vMRbfS5e8DQ@mail.gmail.com>
Subject: QCA988X/hw2.0 firmware versions - what is the difference
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

Hi,

There are two current builds of QCA988X/hw2.0 firmware: -
a) firmware-5.bin_10.2.4-1.0 -> latest -> firmware-5.bin_10.2.4-1.0-00043
b) firmware-5.bin_10.2.4.70 -> latest -> firmware-5.bin_10.2.4.70.69

The site https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware
indicates that both of these are suitable for Kernel version 4 and
they both work in my ar71xx-generic-archer-c7-v2 router with OpenWrt
18.06.1 which was itself originally packaged with 10.2.4-1.0-00033

Both firmware have the same options: -
firmware ver 10.2.4.70.69        api 5 features
no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 edfb196a
firmware ver 10.2.4-1.0-00043 api 5 features
no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 ed0aafd8

What is the difference between the two builds?

Are there release notes for the builds?

Kindest regards,
Richard

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
