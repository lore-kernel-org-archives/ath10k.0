Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJMg6-0005R3-L8
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 14:45:39 +0000
Received: by mail-lf0-x233.google.com with SMTP id 17so54469433lfz.1
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 06:45:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk7O4Lq2rcZG9pLZJij27COWiCUz=g8SNEp2df3CKV-vg@mail.gmail.com>
References: <CAGvpMW8JW+a6-MS=TrRNFvBDG4LWYFR+2fM09dFhQEes7NEn4w@mail.gmail.com>
 <CA+BoTQk313y4GA-yq01LBad8ccf2OepU6vP_t7PjAJ1a1DR_7Q@mail.gmail.com>
 <CAGvpMW9d8RZGpfBd2H0W35fVUQoi9jcZvQmTC7ztW+dPVcxOhg@mail.gmail.com>
 <CA+BoTQk7O4Lq2rcZG9pLZJij27COWiCUz=g8SNEp2df3CKV-vg@mail.gmail.com>
Date: Wed, 13 Jan 2016 18:45:16 +0400
Message-ID: <CAGvpMW_wSfe8m+WtwhS0aRj8o0MioPi2o2FKZ3Vjk7ei-x7iOw@mail.gmail.com>
Subject: Re:
From: Alexey Ivanov <alexeyivan@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

>Strange..

Do you have any idea what it can be?
"map pages failed" seems to be a result of failing to vmap() buffer in
fw_map_pages_buf() in firmware_loading_store()

-- 
Best regards,
Alex Ivanov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
