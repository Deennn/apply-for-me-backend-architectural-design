package ng.hng.hydraulic.applyforme.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Collection;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "PROFESSIONAL")
public class Professional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)

    @JoinColumn(name = "member_id")
    private Member member;

    @Column(name = "available_for_interview" , nullable = false)
    private boolean availableForInterview;

    @OneToOne(mappedBy = "professional")
    private Applier applier;

    @OneToOne(mappedBy = "professional")
    private ProfessionalAttachment professionalAttachment;

    @OneToOne(mappedBy = "professional")
    private ProfessionalMetadata professionalMetadata;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "professional")
    private Collection<Submission> submission;
}
