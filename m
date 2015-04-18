Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YjYs0-0001k9-LN
 for ath10k@lists.infradead.org; Sat, 18 Apr 2015 19:57:41 +0000
Received: by wgyo15 with SMTP id o15so142940774wgy.2
 for <ath10k@lists.infradead.org>; Sat, 18 Apr 2015 12:57:17 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 19 Apr 2015 00:57:17 +0500
Message-ID: <CADxDmp4USuF-qFY50NFfKcYcwd-fHs9AT662aWi8UEsBcapixw@mail.gmail.com>
Subject: A-MPDUs in 20/40 mode
From: Kamran Nishat <kamran.nishat@gmail.com>
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
To: ath9k-devel <ath9k-devel@lists.ath9k.org>, ath9k-devel <ath9k-devel@venema.h4ckr.net>, ath10k@lists.infradead.org, Adrian Chadd <adrian.chadd@gmail.com>, Adrian Chadd <adrian@freebsd.org>

 Hi,
 according to wireshark (radiotap.mcs.bw field) some MPDUs in an
A-MPDU are recieved at 40Mhz while others are reiceved at 20Mhz. AP is
working in 20/40 mixed mode. I dont think bandwidth change within an
A-MPDU is possible. Is there a bug in wireshark or in my
inderstanding?

kamran

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
