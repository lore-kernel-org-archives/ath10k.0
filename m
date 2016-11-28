Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBIYH-0001ZA-8P
 for ath10k@lists.infradead.org; Mon, 28 Nov 2016 09:48:48 +0000
Received: by mail-oi0-x230.google.com with SMTP id b126so143392146oia.2
 for <ath10k@lists.infradead.org>; Mon, 28 Nov 2016 01:48:29 -0800 (PST)
MIME-Version: 1.0
From: yu-chieh kung <jay0607@gmail.com>
Date: Mon, 28 Nov 2016 17:48:28 +0800
Message-ID: <CAGJdtRCGbavfaLi_40B30CGnnBdA2f2zWKT+63GKSfjHOz4seg@mail.gmail.com>
Subject: Who decide "Duration"?
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

Hi All,

Does anyone know who decide duration in ath10k.
Decided by rate table or ?

I am using 998x chipset with CT firmware in IBSS mode
I did some experiment.

I create a ack (or Block Ack), send via MGMT_TID.
the date rate is 6Mb, and duration is 60.

i check the normal ack (or Block Ack),
date rate is 6Mb as well, but the duration is 0.

is it possible to send ack with duration 0 via MGMT_TID?
or there is any other TID which is used for ACK?

Thanks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
