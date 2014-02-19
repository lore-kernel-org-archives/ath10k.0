Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFyVm-0002Cp-EE
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 04:11:55 +0000
Received: by mail-ve0-f175.google.com with SMTP id c14so14520011vea.34
 for <ath10k@lists.infradead.org>; Tue, 18 Feb 2014 20:11:32 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 19 Feb 2014 12:11:30 +0800
Message-ID: <CAEFj984MeGN=tfBb69rvCm0EvK4txH+vgPyGO7w57v-V1ATHDw@mail.gmail.com>
Subject: QoS Control Field Stripped Off
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, all

Anyone knows whether it is possible to modify the QoS Control field in
the Tx Frame.

Currently, the QoS control field is stripped off before passing to FW.
I would like to set the bit-8 of QoS control field to indicate the
presence of mesh control field.

Thanks

Regards,
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
