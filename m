Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSEFe-0000ZE-0s
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 02:07:14 +0000
Received: by mail-pf0-x235.google.com with SMTP id h186so5333370pfg.3
 for <ath10k@lists.infradead.org>; Tue, 26 Jul 2016 19:06:53 -0700 (PDT)
Received: from ?IPv6:2606:6000:c1c0:a200:ac37:cf61:c6f:2c0b?
 ([2606:6000:c1c0:a200:ac37:cf61:c6f:2c0b])
 by smtp.googlemail.com with ESMTPSA id o80sm4289610pfa.67.2016.07.26.19.06.51
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jul 2016 19:06:52 -0700 (PDT)
Subject: Re: Coverage class on ath10k
References: <mailman.34731.1463383905.1639.ath10k@lists.infradead.org>
From: Petar Vutov <pvutov@solectek.com>
Message-ID: <5798173A.50001@solectek.com>
Date: Tue, 26 Jul 2016 19:06:50 -0700
MIME-Version: 1.0
In-Reply-To: <mailman.34731.1463383905.1639.ath10k@lists.infradead.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi All,

Does anyone know how I can modify coverage class for ath10k?

It looks like that command  'iw phy0 set distance <meters>' doesn't get 
to the firmware on QCA98XX due to missing function set_coverage_class.

Is there any other way to manipulate ack timeout and slot time on the 
firmware?

Thanks,

Petar Vutov
Director of Software Engineering
Solectek Corp.
8969 Kenamar Drive, Suite 113
San Diego, CA 92121
1-858-450-1220 Ext 3008
www.solectek.com



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
